// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.17;

import {MarketAPI} from "@zondax/filecoin-solidity/contracts/v0.8/MarketAPI.sol";
import {MarketTypes} from "@zondax/filecoin-solidity/contracts/v0.8/types/MarketTypes.sol";
import {CommonTypes} from "@zondax/filecoin-solidity/contracts/v0.8/types/CommonTypes.sol";

contract Check {
    function checkDealStatus(
        uint64 _dealID
    ) public view returns (MarketTypes.GetDealActivationReturn memory) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI
            .getDealActivation(_dealID);
        return ret;
    }

    function checkDealStatusData(
        uint64 _dealID
    )
        public
        view
        returns (MarketTypes.GetDealActivationReturn memory, int, int)
    {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI
            .getDealActivation(_dealID);
        return (
            ret,
            CommonTypes.ChainEpoch.unwrap(ret.terminated),
            CommonTypes.ChainEpoch.unwrap(ret.activated)
        );
    }

    function checkDealStatusData1(
        uint64 _dealID
    )
        public
        view
        returns (MarketTypes.GetDealActivationReturn memory, int64, int64)
    {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI
            .getDealActivation(_dealID);
        return (
            ret,
            CommonTypes.ChainEpoch.unwrap(ret.terminated),
            CommonTypes.ChainEpoch.unwrap(ret.activated)
        );
    }

    function getTerminationTime(uint64 _dealID) public view returns (int64) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI
            .getDealActivation(_dealID);
        int64 terminal = CommonTypes.ChainEpoch.unwrap(ret.terminated);
        return terminal;
    }

    function getTermination(
        uint64 _dealID
    ) public view returns (CommonTypes.ChainEpoch) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI
            .getDealActivation(_dealID);
        CommonTypes.ChainEpoch terminal = ret.terminated;
        return terminal;
    }

    function getTerminationTimeEpoch(
        uint64 _dealID
    ) public view returns (CommonTypes.ChainEpoch) {
        MarketTypes.GetDealActivationReturn memory ret = MarketAPI
            .getDealActivation(_dealID);
        return ret.terminated;
    }

    function checkAllFunctions(
        uint64 _dealId
    ) public view returns (MarketTypes.GetDealActivationReturn memory) {
        return (MarketAPI.getDealActivation(_dealId));
    }

    function getDealTime(
        uint64 _dealId
    ) public view returns (MarketTypes.GetDealTermReturn memory) {
        return (MarketAPI.getDealTerm(_dealId));
    }

    function getDealEndEpoch(
        uint64 _dealId
    ) public view returns (CommonTypes.ChainEpoch) {
        MarketTypes.GetDealTermReturn memory ret = MarketAPI.getDealTerm(
            _dealId
        );
        return ret.end;
    }

    function getDealStartEpoch(
        uint64 _dealId
    ) public view returns (CommonTypes.ChainEpoch) {
        MarketTypes.GetDealTermReturn memory ret = MarketAPI.getDealTerm(
            _dealId
        );
        return ret.start;
    }
}
