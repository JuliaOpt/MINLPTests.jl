# Test Goals:
# - infeasible model

m = Model(optimizer)

@variable(m, x, Int)
@variable(m, y, Int)

@NLconstraint(m, y == exp(x))
@constraint(m, x == y^2)

optimize!(m)

check_status(m, termination_targe=JuMP.MOI.LOCALLY_INFEASIBLE, primal_target=JuMP.MOI.INFEASIBLE_POINT)
