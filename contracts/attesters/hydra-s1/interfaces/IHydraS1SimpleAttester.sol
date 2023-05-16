// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;
pragma experimental ABIEncoderV2;

import {Attestation} from '../../../core/libs/Structs.sol';
import {IAttester} from '../../../core/interfaces/IAttester.sol';
import {CommitmentMapperRegistry} from '../../../periphery/utils/CommitmentMapperRegistry.sol';
import {AvailableRootsRegistry} from '../../../periphery/utils/AvailableRootsRegistry.sol';
import {HydraS1Lib, HydraS1ProofData, HydraS1ProofInput} from './../libs/HydraS1Lib.sol';
import {IHydraS1Base} from './../base/IHydraS1Base.sol';

// todo: explain well what is specific to this attester
interface IHydraS1SimpleAttester is IHydraS1Base, IAttester {
  error TicketUsed(uint256 userTicket);

  event TicketDestinationUpdated(uint256 ticket, address newOwner);

  /**
   * @dev Getter, returns the last attestation destination of a ticket
   * @param userTicket ticket used
   **/
  function getDestinationOfTicket(uint256 userTicket) external view returns (address);

  // /**
  //  * @dev Getter
  //  * returns of the first collection in which the attester is supposed to record
  //  **/
  // function AUTHORIZED_COLLECTION_ID_FIRST() external view returns (uint256);

  // /**
  //  * @dev Getter
  //  * returns of the last collection in which the attester is supposed to record
  //  **/
  // function AUTHORIZED_COLLECTION_ID_LAST() external view returns (uint256);
}
