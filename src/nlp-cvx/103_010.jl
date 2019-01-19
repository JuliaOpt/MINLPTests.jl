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

check_status(status)
check_objective(m, 0)
check_solution([x,y], [0, 0])
