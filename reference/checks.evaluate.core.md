# Common checks for all functions

Not exported. Strictly internal

## Usage

``` r
checks.evaluate.core(
  data,
  names,
  quantitative = NULL,
  qualitative = NULL,
  selected
)
```

## Arguments

- data:

  The data as a data frame object. The data frame should possess one row
  per individual and columns with the individual names and multiple
  trait/character data.

- names:

  Name of column with the individual names as a character string.

- quantitative:

  Name of columns with the quantitative traits as a character vector.

- qualitative:

  Name of columns with the qualitative traits as a character vector.

- selected:

  Character vector with the names of individuals selected in core
  collection and present in the `names` column.
