FROM fireflyiii/data-importer:version-0.9.10

RUN cp /usr/local/bin/entrypoint.sh /usr/local/bin/ledger-entrypoint.sh

RUN sed s/"echo \"Will launch auto import on \/import directory.\""/"echo \"Running the importer command.\""/g \
	--in-place /usr/local/bin/ledger-entrypoint.sh

RUN sed s/"php artisan importer:auto-import \/import"/"exec \$@"/g \
	--in-place /usr/local/bin/ledger-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/ledger-entrypoint.sh" ]
CMD [ "ls -lsa" ]
