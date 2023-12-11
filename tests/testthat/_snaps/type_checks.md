# check_integerish

    Code
      check_is_integerish(value)
    Condition
      Error:
      ! `x` must be integer like
      i `value` is 1.1

---

    Code
      check_is_integerish(value)
    Condition
      Error:
      ! `x` must be integer like
      i `value` is "hej"

---

    Code
      test()
    Condition
      Error in `test()`:
      ! `x` must be integer like
      i `1.1` is 1.1

---

    Code
      test(hej = value)
    Condition
      Error in `test()`:
      ! `x` must be integer like
      i `value` is "hej"

# check is numeric

    Code
      check_is_numeric(value)
    Condition
      Error:
      ! `x` must be numeric
      i `value` is "hej"

---

    Code
      test()
    Condition
      Error in `test()`:
      ! `x` must be numeric
      i `"hej"` is "hej"

---

    Code
      test(hej = value)
    Condition
      Error in `test()`:
      ! `x` must be numeric
      i `value` is "hej"

