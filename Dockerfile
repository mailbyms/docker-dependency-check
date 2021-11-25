FROM owasp/dependency-check

USER root

RUN sed -i '/org.owasp.dependencycheck.App/a\  --cveUrlModified http://192.168.1.193:8089/nvdcve-1.1-modified.json.gz --cveUrlBase http://192.168.1.193:8089/nvdcve-1.1-%d.json.gz --retireJsUrl http://192.168.1.193:8089/jsrepository.json --scan /drone/src --format "ALL" --out /drone/src/report \\' /usr/share/dependency-check/bin/dependency-check.sh
