// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract OptimizedVote {
    struct Voter {
        uint8 vote;
        bool voted;
    }

    struct Proposal {
        uint8 voteCount;
        bytes32 name;
        //bool ended;
    }

    mapping(address => Voter) public voters;

    mapping(uint8 => Proposal) public proposalMap; //id => proposal
    uint8 actualID = 0;
    
    function createProposal(bytes32 _name) external {
        unchecked {
            Proposal memory proposal = Proposal({voteCount: 0, name: _name});
            proposalMap[actualID] = proposal;
            ++actualID;
        }
    }

    function vote(uint8 _proposal) external {

        unchecked {
            Voter storage voter = voters[msg.sender];
            require(!voter.voted, 'already voted');
            voter.vote = _proposal;
            voter.voted = true;
            Proposal storage proposal = proposalMap[_proposal];
            ++proposal.voteCount;
        }
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8 ) {
        unchecked {
            return proposalMap[_proposal].voteCount;
        }
    }
}
