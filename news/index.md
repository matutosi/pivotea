# Changelog

## pivotea 1.0.2

CRAN release: 2024-07-13

- 2024-07-15

- Remove duplicated data in `hogwarts`.

- Add argument rm_empty_df in [`pivot()`](../reference/pivot.md).

- Use pkgdown.

## pivotea 1.0.1

CRAN release: 2023-07-16

- 2023-07-15

- Add data: `hogwarts` which includes timetable in Hogwarts School of
  Witchcraft and Wizardry.

- Fix bug in [`split_force()`](../reference/split_force.md).

## pivotea 1.0.0

CRAN release: 2023-06-15

- 2023-06-15

- First release

  - Add [`pivot()`](../reference/pivot.md) and related functions:
    [`add_group_sub()`](../reference/add_group_sub.md),
    [`validate_col()`](../reference/validate_col.md) and
    [`split_force()`](../reference/split_force.md)
  - Add util functions: `omit_na_row()`,
    [`has_col()`](../reference/has_col.md), `omit_na_col()`,
    [`extract_col()`](../reference/extract_col.md), and
    [`na2empty()`](../reference/na2empty.md)
