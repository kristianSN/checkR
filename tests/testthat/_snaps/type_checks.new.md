# check_integerish

    Code
      check_is_integerish(value)
    Condition
      Error:
      ! `x` must be integer like.
      i `value` is "double".

---

    Code
      check_is_integerish(value)
    Condition
      Error:
      ! `x` must be integer like.
      i `value` is "character".

---

    Code
      test()
    Condition
      Error in `test()`:
      ! `x` must be integer like.
      i `1.1` is "double".

---

    Code
      test(hej = value)
    Condition
      Error in `test()`:
      ! `x` must be integer like.
      i `value` is "character".

# check is numeric

    Code
      check_is_numeric(value)
    Condition
      Error:
      ! `x` must be numeric.
      i `value` is "character".

---

    Code
      test()
    Condition
      Error in `test()`:
      ! `x` must be numeric.
      i `"hej"` is "character".

---

    Code
      test(hej = value)
    Condition
      Error in `test()`:
      ! `x` must be numeric.
      i `value` is "character".

