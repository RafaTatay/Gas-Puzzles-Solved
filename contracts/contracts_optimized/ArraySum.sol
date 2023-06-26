// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;
contract OptimizedArraySum{
    // Do not modify this
    uint256[] array;

    // Do not modify this
    function setArray(uint256[] memory _array) external {
        require(_array.length <= 10, 'too long');
        array = _array;
    }

    // Original: 27376 gas
    function originalgetArraySum() external view returns (uint256) {
        uint256 sum;
        for (uint256 i = 0; i < array.length; i++) {
            sum += array[i];
        }

        return sum;
    }

    // Mddofied: 26251 gas-> 25292 gas -> 25279 gas
    function getArraySum() external view returns (uint256 sum) {
        uint256 length = array.length;
        for (uint256 i = 0; i < length;) {
            sum += array[i];

            unchecked{
                ++i;
            }
        }
    }
}