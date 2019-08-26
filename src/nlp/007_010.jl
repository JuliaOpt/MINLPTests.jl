function nlp_007_010(optimizer, objective_tol, primal_tol, dual_tol;
        termination_target = JuMP.MOI.LOCALLY_INFEASIBLE,
        primal_target = JuMP.MOI.NO_SOLUTION)
    # Test Goals:
    # - infeasible model

    m = Model(optimizer)

    @variable(m, x)
    @variable(m, y)

    @NLconstraint(m, y == exp(x))
    @constraint(m, x == y^2)

    optimize!(m)

    check_status(m, termination_target, primal_target)

end
