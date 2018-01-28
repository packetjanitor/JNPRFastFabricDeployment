# JNPR Fast Fabric Deployment
My bosses boss was super excited about some additions to an existing technology that ended up getting delayed. So, there I am: A guy with a gear and time over the holidays since my wife was working.

I orignally built this lab in python with DAY ONE:JUNOS PyEZCOOKBOOK as guidance but it was complicated and exhausting and I didn't know how I would ever hand it off. The reason you do something like this is so you can give it away.

I decided to build it with Ansible to resolve two questions. One... How hard is it to automate a basic fabric from Juniper? Two... What the implications are of running different protocols in the underlay?

To answer question 1. Two weeks. From zero to what you see here. This is the most basic form of automation available (command line scripting). It's most definitely not the best solution for large networks but if you need a start line. I think this might be a place to begin.

To answer question 2. If you are ever doing a POC with this, I'm sure you'll tune the protocols and work to achieve faster failover or more granular load-balancing but from my testing in smaller networks you'll find OSPF super easy to configure and troubleshoot; IS-IS scales much more than OSPF and runs IPv6 natively but is harder to chase problems down in; and BGP scales the best, has the fastest default failover/failback but requires alot more configuration and monitoring than the first two plus it's super easy to forget you are working the overlay and mess up the underlay.

Here's a preview of the network and automation in action. https://www.youtube.com/watch?v=yYjfuQ_iuhU 
