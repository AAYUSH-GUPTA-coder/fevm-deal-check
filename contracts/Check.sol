// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.17;

import {MarketAPI} from "@zondax/filecoin-solidity/contracts/v0.8/MarketAPI.sol";
import {MarketTypes} from "@zondax/filecoin-solidity/contracts/v0.8/types/MarketTypes.sol";
import {CommonTypes} from "@zondax/filecoin-solidity/contracts/v0.8/types/CommonTypes.sol";

contract Check {
    function checkDealStatus(
        uint64 _dealID
    ) public returns (MarketTypes.GetDealActivationReturn memory) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI.getDealActivation(_dealID);
        return ret;
    }

    function checkDealStatusData(
        uint64 _dealID
    ) public returns (MarketTypes.GetDealActivationReturn memory, int, int) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI.getDealActivation(_dealID);
        return (
            ret,
            CommonTypes.ChainEpoch.unwrap(ret.terminated),
            CommonTypes.ChainEpoch.unwrap(ret.activated)
        );
    }

    function checkDealStatusData1(
        uint64 _dealID
    ) public returns (MarketTypes.GetDealActivationReturn memory, int64, int64) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI.getDealActivation(_dealID);
        return (
            ret,
            CommonTypes.ChainEpoch.unwrap(ret.terminated),
            CommonTypes.ChainEpoch.unwrap(ret.activated)
        );
    }

    function getTerminalTime(uint64 _dealID) public returns (int64) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI.getDealActivation(_dealID);
        int64 terminal = CommonTypes.ChainEpoch.unwrap(ret.terminated);
        return terminal;
    }

    function getTerminalTimeEpoch(uint64 _dealID) public returns (CommonTypes.ChainEpoch) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI.getDealActivation(_dealID);
        return ret.terminated;
    }
}
