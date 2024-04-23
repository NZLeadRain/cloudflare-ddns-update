#Configuration
Create the following env vars
- CF_EMAIL="you@domain.com"                      #your cloudflare email address
- CF_KEY="aaaabbbbccccdddd1111222233334444"      #your cloudflare API key
- CF_ZONE_ID="aaaabbbbccccdddd1111222233334444"  #the zoneid where the record sits (you need to find this with api calls)
- CF_HOST_ID="aaaabbbbccccdddd1111222233334444"  #the record ID for the hostname (again with API calls)
- CF_PROXIED="true"                              #Do you want to enable Cloudflare proxing for the record (defaults to false)
- CF_HOSTNAME="host.domain.com"                  #The human readable A record name

#Further documentation to come.