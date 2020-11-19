When try to connect to a cassandra server use ssh tunnel in datagrip on Macos big sur get the error:
`
All host(s) tried for query failed (tried: localhost/127.0.0.1:59903 (com.datastax.driver.core.exceptions.OperationTimedOutException: [localhost/127.0.0.1:59903] Operation timed out)).
`

`
SSH: Failed to create local tu
`

Solution:
Setup to use 9099 or other port on the "local port" setting. don't use <Dynamic> port

 
