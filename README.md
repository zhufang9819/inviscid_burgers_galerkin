# Inviscid Burgers Equation Solver using Galerkin Method
This repository contains an implementation of the Galerkin method to solve the inviscid Burgers equation. The code is written in MATLAB and is contained in the file `burgers_galerkin.m`.

## Overview
The Galerkin method is used to transform the original partial differential equation into a system of ordinary differential equations, which can be solved using standard numerical techniques. The solution to the equation is represented as a finite series expansion of sinusoidal basis functions. The coefficients of these basis functions are functions of time, and the basis functions themselves are sinusoidal functions.

The Galerkin method involves setting the projection of the residual onto each of the basis functions in the series expansion to be zero. This leads to a system of ordinary differential equations for the coefficients. These equations can be solved numerically to obtain the coefficients, which are then used to obtain the approximate solution.

For a detailed explanation of the solution algorithm, please refer to the `notes.pdf` file included in this repository.

## Running the tests
To run the tests for this system, use the following command in MATLAB:

```matlab
burgers_galerkin(N, T_max);
```

Where N is the number of the basis function and T_max is the maximum time. For example:

```matlab
burgers_galerkin(9, 2);
```

## Contributing
Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

## Authors
Fang Zhu - Initial work - zhufang9819
See also the list of contributors who participated in this project.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details