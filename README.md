# MPPT-Swarm-Algorithm-Application
implement several kinds of Swarm algorithm to Photovoltaic Maxium Power Point Tracking(MPPT)   
   
Appreciate model from [roisalhaqq](https://github.com/roisalhaqq/researchpso)  
#### Why salp swarm algorithm converged faster than particle swarm optimization?
From the perspective of algorithm mechanism, particle swarm optimization lets particles pass through every local optimal and gets the exact value of the local optimal solution to avoid getting stuck in a
local optimal. This is the most direct and accurate method, but it is not efficient, most of the iteration/computing resources were used to obtain the excat value of optimal solution(in most cases, obtaining the excat value of optimal solution is meaningless), while Salp Swarm Algorithm
directly searcheing for the global optimal solution through chain-like movement, sacrificing exploration ability for faster convergence speed.
