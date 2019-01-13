# Test Goals:
# - linear objective
# - intersection convex quadratic constraints
# Variants
#   010 - one binding constraint (inflection point)
#   011 - one binding constraint (inflection point)
#   012 - one binding constraint (non-inflection point)
#   013 - one binding constraint (non-inflection point)
#   014 - intersection point

m = Model(solver=solver)

@variable(m, x)
@variable(m, y)

@objective(m, Min, y)
@NLconstraint(m, x^2 <= y)
@NLconstraint(m, -x^2 + 1 >= y)

status = solve(m)

@test status == :Optimal
@test isapprox(getobjectivevalue(m), 0.0, atol=opt_tol)
@test isapprox(getvalue(x), 0.0, atol=sol_tol)
@test isapprox(getvalue(y), 0.0, atol=sol_tol)
