# Install JuMP and GLPK
using Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")
using JuMP, GLPK

# Create a simple model for a first test
m = Model(GLPK.Optimizer)

# Two variables, x and y
@variable(m, 0 <= x <= 2)
@variable(m, 0 <= y <= 30)

# Objective is to maximize 5x+3y
@objective(m, Max, 5x + 3 * y)

# With the constraint that x +5y must be less than 3
@constraint(m, 1x + 5y <= 3.0)

# Run optimization and print results
JuMP.optimize!(m)
println("Objective value: ", JuMP.objective_value(m))
println("x = ", JuMP.value(x))
println("y = ", JuMP.value(y))

# Skipping the Guropi and CPLEx

# Plots
Pkg.add("Plots")
using Plots
x = 1:10;
y = rand(10); # These are the plotting data
plot(x, y, label="my label")
