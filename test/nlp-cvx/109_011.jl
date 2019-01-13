m = Model(solver=solver)

@variable(m, x, start=0.1)
@variable(m, y, start=0.1)

@NLobjective(m, Max, log(x) + log(y))
@NLconstraint(m, (y-2)^2 <= -x+2)

status = solve(m)

@test status == :Optimal
@test isapprox(getobjectivevalue(m), 1.4853479762665618, atol=opt_tol)
@test isapprox(getvalue(x), 1.8499011869994715, atol=sol_tol)
@test isapprox(getvalue(y), 2.387425887570236, atol=sol_tol)
