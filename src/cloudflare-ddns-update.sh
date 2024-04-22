#!/bin/bash
#Updates cloudflare DNS zone record with the public ip address detected by the container.

getPublicIP() {
    echo $(curl -s ipinfo.io/ip)
}

updateCloudFlare(){
    #API declaration do not change this
    url="https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/dns_records/$CF_HOST_ID"
    data="{\"type\":\"A\",\"name\":\"$CF_HOSTNAME\",\"content\":\"$(getPublicIP)\",\"ttl\":120,\"proxied\":$CF_PROXIED}"

    echo `curl -s --request PUT -H "X-Auth-Email: ${CF_EMAIL}" -H "X-Auth-Key: ${CF_KEY}" -H "content-type: application/json"  $url --data $data`

}

echo "Beginning DNS Update"
result=updateCloudFlare
if ($($result | jq '.success') -eq true)
then
    echo "update complete successfully: $($result | jq '.result.content')"
else
    echo "update failed: $($result | jq '.errors[0].message')"
fi
