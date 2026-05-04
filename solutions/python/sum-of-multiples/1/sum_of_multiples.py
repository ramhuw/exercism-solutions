def sum_of_multiples(limit, multiples):
    return sum([i for i in range(limit) if any([multiple != 0 and i % multiple == 0 for multiple in multiples])])
