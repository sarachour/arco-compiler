Minimize
  obj1: slackmax_A + slackmin_A + slackmax_B + slackmin_B + slackmax_C + slackmin_C

Subject To
  amin: 0 sc_A + os_A + slackmin_A = 0.0001 
  amax: 1 sc_A + os_A + slackmax_A = 0.01

  bmin: 0 sc_B + os_B + slackmin_B = 0.0001 
  bmax: 1 sc_B + os_B + slackmax_B = 0.01 

  equiv: [ sc_A * sc_B ] / 2 - sc_C = 0
  cmin: 1 sc_C + os_C + slackmin_C = 0.0000001
  cmax: 1 sc_C + os_C + slackmax_C = 0.001


Bounds
  sc_A free
  os_A free
  slackmin_A free
  slackmax_A free

  sc_B free
  os_B free
  slackmin_B free
  slackmax_B free

  os_B = 0
  os_A = 0

Semis
  sc_A os_A slackmin_A slackmax_A
  sc_B os_B slackmin_B slackmax_B
  sc_C os_C slackmin_C slackmax_C

End