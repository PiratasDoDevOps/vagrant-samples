FROM mysql:5.6.22
COPY docker-entrypoint.sh /entrypoint.sh
COPY root.sql /tmp/root.sql
COPY users.sql /tmp/users.sql
COPY data.sql /tmp/data.sql
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
