#######
##FEM Stochastic Heat Animation Test
#######

#Generates an animation for a solution of the heat equation
#Uses Plots.jl, requires matplotlib >=1.5
#Will work on Windows, but will give blurry output
using DifferentialEquations
T = 3
Δx = 1//2^(3)
Δt = 1//2^(10)
femMesh = parabolic_squaremesh([0 1 0 1],Δx,Δt,T,"Neumann")
pdeProb = heatProblemExample_stochasticbirthdeath()

res = fem_solveheat(femMesh::FEMmesh,pdeProb::HeatProblem,alg="Euler",fullSave=true,solver="LU")

println("Generating Animation")
solplot_animation(res::FEMSolution;zlim=(0,3),vmax=.1,cbar=false) #Make animation

#Variance implies stochastic. Returns true if properly stochastic
var(res.u) > .00001 