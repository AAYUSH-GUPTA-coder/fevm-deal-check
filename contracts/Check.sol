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
