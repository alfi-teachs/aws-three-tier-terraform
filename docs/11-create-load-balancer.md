architecture
```bash

                   Internet
                       │
                Application Load Balancer
                 (Public Subnets)
                       │
               HTTP Listener (80)
                       │
                 Target Group
                       │
        ┌──────────────┴──────────────┐
        │                             │
     EC2 Instance 1              EC2 Instance 2
   (Private Subnet 1)          (Private Subnet 2)

   ```