m = Model(optimizer)

@variable(m, x)
@variable(m, y)

@objective(m, Min, x^2+y^2)
@NLconstraint(m, x^2 + y^2 <= 1.0)
@constraint(m, x + y >= 1.2)

optimize!(m)

check_status(m)
check_objective(m, 0.72)
check_solution([x,y], [0.6, 0.6])
