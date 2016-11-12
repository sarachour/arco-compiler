Minimize
  obj1: slackmax_A + slackmin_A

Subject To
  csmin: 0 sc_A + os_A + slackmin_A = 0.0001 
  csmax: 1 sc_A + os_A + slackmax_A = 0.01 

Bounds
  sc_A free
  os_A free
  slackmin_A free
  slackmax_A free

Semis
  sc_A os_A slackmin_A slackmax_A

End