---
title: Access Token (ASP.NET Core)
description: To be able to use Sdir public APIs you need to ble able to authenticate and have the necessary permissions. 
weight: 20
---

## Maskinporten integration 

In this example you can use the certificate in the .p12-keystore format.



#### Maskinporten settings:

{{% panel %}}
**Settings** <br><br>
**ClientId**: [your test integration id]<br>
**MaskinportenBaseAddress**: https://ver2.maskinporten.no/<br>
**Scope**: sdir:apstest
{{% /panel %}}




#### ASP.NET Core example code:

```
async Task<AccessTokenModel> CreateMaskinportenToken()
        {
            var jwtAssertion = GetJwtAssertion(_settings);
            var content = GetUrlEncodedContent(jwtAssertion);
            var httpClient = new HttpClient
            {
                BaseAddress = new Uri(_settings.maskinportenBaseAddress)
            };

            var response = await httpClient.PostAsync("token", content);
            if (!response.IsSuccessStatusCode)
            {
                var errorMessage = await response.Content.ReadAsStringAsync();
                throw new HttpRequestException($"Something went wrong. {errorMessage}");
            }
            
            return await System.Text.Json.JsonSerializer.DeserializeAsync<AccessTokenModel>( await response.Content.ReadAsStreamAsync());           
        }

        private static string GetJwtAssertion(MaskinportenSettings _settings)

        {
            var certificate = new X509Certificate2(_settings.certificatePath, _settings.certificatePassword);
            var securityKey = new X509SecurityKey(certificate);
            var header = new JwtHeader(new SigningCredentials(securityKey, SecurityAlgorithms.RsaSha256))
            {
                { "x5c", new List<string> { Convert.ToBase64String(certificate.GetRawCertData()) } }
            };
            header.Remove("typ");
            header.Remove("kid");

            var dateTimeOffset = new DateTimeOffset(DateTime.Now);
            var payload = new JwtPayload
            {
                { "aud", _settings.maskinportenBaseAddress },
                { "scope", _settings.scope },
                { "iss",  _settings.clientId },
                { "exp", dateTimeOffset.ToUnixTimeSeconds() + 120 },
                { "iat", dateTimeOffset.ToUnixTimeSeconds() },
                { "jti", Guid.NewGuid().ToString() },
            };
            var securityToken = new JwtSecurityToken(header, payload);
            var handler = new JwtSecurityTokenHandler();
            return handler.WriteToken(securityToken);
        }

        private static FormUrlEncodedContent GetUrlEncodedContent(string assertion)
        {
            var formContent = new FormUrlEncodedContent(new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("grant_type", "urn:ietf:params:oauth:grant-type:jwt-bearer"),
                new KeyValuePair<string, string>("assertion", assertion),
            });

            return formContent;
        }



```
