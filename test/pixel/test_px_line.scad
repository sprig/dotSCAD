
module test_px_line() {
    echo("==== test_px_line ====");

    include <unittest.scad>;
    include <pixel/px_line.scad>;
    expected =  [[-10, 0, -10], [-9, 1, -10], [-9, 2, -9], [-8, 3, -9], [-8, 4, -8], [-7, 5, -8], [-6, 6, -8], [-6, 7, -7], [-5, 8, -7], [-5, 9, -6], [-4, 10, -6], [-3, 11, -6], [-3, 12, -5], [-2, 13, -5], [-2, 14, -4], [-1, 15, -4], [0, 16, -4], [0, 17, -3], [1, 18, -3], [1, 19, -2], [2, 20, -2], [3, 21, -2], [3, 22, -1], [4, 23, -1], [4, 24, 0], [5, 25, 0], [6, 26, 0], [6, 27, 1], [7, 28, 1], [7, 29, 2], [8, 30, 2], [9, 31, 2], [9, 32, 3], [10, 33, 3], [10, 34, 4], [11, 35, 4], [12, 36, 4], [12, 37, 5], [13, 38, 5], [13, 39, 6], [14, 40, 6], [15, 41, 6], [15, 42, 7], [16, 43, 7], [16, 44, 8], [17, 45, 8], [18, 46, 8], [18, 47, 9], [19, 48, 9], [19, 49, 10]];
    actual = px_line([-10, 0, -10], [20, 50, 10]);

    assertEqualPoints(expected, actual);
}

test_px_line();