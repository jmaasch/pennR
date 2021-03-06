# `pennR`
## University of Pennsylvania Color Palettes

Color palettes for R data visualization based on the official school colors of the University of Pennsylvania.

![density](https://github.com/jmaasch/pennR/blob/master/figures/density_grid.jpg)

Built by JRMA Maasch (2020).

***Note: This package is not endorsed in any way by the University of Pennsylvania.***

## Table of contents

* **[About](#About)** &nbsp; | &nbsp; [License](#License)
* **[Usage](#Usage)** &nbsp; | &nbsp; [Installation](#Installation) &nbsp; | &nbsp; [Documentation](#Documentation) &nbsp; | &nbsp; [Use with ggplot2](#Use-with-ggplot2) &nbsp; | &nbsp; [Use with base R](#Use-with-base-R)
* **[View demo plots](#View-demo-plots)** &nbsp; | &nbsp; [Classic palettes](#Classic-palettes) &nbsp; | &nbsp; [Interpolated palettes](#Interpolated-palettes)

## About

This package provides 13 color palettes based on the official school colors of the University of Pennsylvania. These color palettes are intended for data visualizations that must easily harmonize with Penn's official logo. ***Note: This package is not endorsed in any way by the University of Pennsylvania.***

Two categories of palettes are provided: "classic" and "interpolated." Classic palettes adhere strictly to the official color values of the Penn logo. Interpolated palettes interpolate between the official Penn colors or between an official color value and white. For more information on the Penn logo, see https://branding.web-resources.upenn.edu/elements-penn-logo.

<p align="center">
 <img src="https://github.com/jmaasch/pennR/blob/master/figures/UniversityofPennsylvania_FullLogo_RGB.jpg" width="500"/>
 <br>
 <img src="https://github.com/jmaasch/pennR/blob/master/figures/penn_colors.jpg" width="800"/>
</p>


### License

This package is licensed under the GNU General Public License v3.0 (<a href="https://choosealicense.com/licenses/gpl-3.0/" target="_blank">GPL-3</a>).

&#8593; [return to top](#pennR)

## Usage

### Installation

```R
# Install development version.
# Note: the package devtools must be installed but need not be loaded.
devtools::install_github("jmaasch/pennR")

# Load package.
library(pennR)
```

&#8593; [return to top](#pennR)

### Documentation

Precede any function by a question mark to access description, arguments, return value, and usage suggestions. **Vignette and further documentation coming soon.**

```R
# Access function documentation.
?penn()
```

All palettes are stored in the exported list `penn_palettes`:

```R
> names(penn_palettes)
 [1] "Red"            "Blue"           "Red-Blue"       "Red-Blue-White" "Blue 3"        
 [6] "Blue 5"         "Blue 8"         "Blue-Red 3"     "Blue-Red 5"     "Blue-Red 8"    
[11] "Red 3"          "Red 5"          "Red 8"
```

To use a palette, pass the desired palette name as a string to `penn()`:

```R
my_palette <- penn("Blue 5")
```

Demo plots can be viewed by invoking the `penn.demo()` and `penn.demo.all()` functions. 
```R
penn.demo("Blue-Red 3")
penn.demo.all()
```

Hexadecimal color codes are accessible as shown below. Demo plots also feature hexadecimal legends for convenience. Hex values may be "cherry-picked" to create custom palettes.

```R
> penn("Red 3")
[1] "#990000" "#C56F6F" "#E5BFBF"
```

&#8593; [return to top](#pennR)

### Use with `ggplot2`

The following reproducible example produces the plots below.

```r

# Construct toy data.
set.seed(5)
df <- data.frame(Label = factor(rep(c("A", "B", "C"), each = 200)),
                 Value = round(c(rnorm(200, mean = 55, sd = 5), 
                                 rnorm(200, mean = 65, sd = 5),
                                 rnorm(200, mean = 70, sd = 4))))
# Construct plot.
density <- ggplot(df, 
                  aes(x = Value, 
                      fill = Label)) +
          geom_density(alpha = 0.9,
                       color = NA) +
          theme_classic() +
          theme(legend.position = "bottom",
                legend.title = element_blank(),
                axis.title = element_blank()) +
          scale_x_continuous(expand = c(0, 0)) +
          scale_fill_manual(values = penn("Blue-Red 3")) +
          labs(title = "Blue-Red 3")

```

![density2](https://github.com/jmaasch/pennR/blob/master/figures/density_grid2.jpg)

&#8593; [return to top](#pennR)

<img src="https://github.com/jmaasch/pennR/blob/master/figures/heat.jpg" width="300" align="right"/>

### Use with base R

The following reproducible example produces the plot at right.

```r
# Construct base R heatmap.
df <- scale(mtcars)
heatmap(df, 
        scale = "row",
        col = penn("Blue 8"),
        labRow = FALSE, 
        labCol = FALSE)
```


&#8593; [return to top](#pennR)

## View demo plots

### Classic palettes

![classic](https://github.com/jmaasch/pennR/blob/master/figures/classic_grid.jpg)

&#8593; [return to top](#pennR)

### Interpolated palettes

![interp](https://github.com/jmaasch/pennR/blob/master/figures/interp_grid.jpg)

&#8593; [return to top](#pennR)
