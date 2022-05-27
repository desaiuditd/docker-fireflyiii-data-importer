FROM fireflyiii/data-importer:version-0.9.10

RUN cp /usr/local/bin/entrypoint.sh /usr/local/bin/ledger-entrypoint.sh

# Original File
# https://dev.azure.com/Firefly-III/_git/ImportToolImage?path=/entrypoint.sh&version=GBmain&line=95&lineEnd=96&lineStartColumn=1&lineEndColumn=42&lineStyle=plain&_a=contents

RUN sed s/"echo \"Will launch auto import on \/import directory.\""/"echo \"Running the importer command.\""/g \
	--in-place /usr/local/bin/ledger-entrypoint.sh

RUN sed s/"php artisan importer:auto-import \/import"/"exec \$@"/g \
	--in-place /usr/local/bin/ledger-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/ledger-entrypoint.sh" ]
CMD [ "ls -lsa" ]
