// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MyNFT is ERC721Enumerable, Ownable {
    struct nft_metadata {
        uint256 index;
        string name;
        string prompt;
        string image;
    }

    nft_metadata[] public nfts;
    uint256 public total_quantity = 5;
    uint256 public current_token_id = 0;

    constructor() ERC721("NFTs", "Multiple") {
        nfts.push(
            nft_metadata(
                0,
                "Elon Musk Hand Shake",
                "Elon Musk and Viktor Orban shaking hands in the style. In the background there is a battleship called Wokeness exploding. ",
                "QmTMEPryi9Mq4UvcuTvx28e7yEHBPYYTaXvdUnTBmj9ovg"
            )
        );
        nfts.push(
            nft_metadata(
                1,
                "Horse On Fire",
                "horse on fire with wings",
                "QmWu4GXz8MkXWGvNh2Wsz2WActsb2h3LJmiGJGWHVZvHHr"
            )
        );
        nfts.push(
            nft_metadata(
                2,
                "Lab Research",
                "a theoritical physicist researching in his lab",
                "QmSurn71QdFJ4j79E15L9ySBjbTj1EJ6bNXSGNrZy8xX5P"
            )
        );
        nfts.push(
            nft_metadata(
                3,
                "Venice",
                "venice, most beautiful place on earth, realistic photo",
                "QmfPuUmEK2GygMJEeXG6KdY6JGVcrvchB9HpCvtsBZ2Bxq"
            )
        );
        nfts.push(
            nft_metadata(
                4,
                "View From Saturn",
                "a boy sitting on saturn rings seeing the universe",
                "QmdoZpyt6tTnZspoBau1pnvvMM8BzVqrytv8vkJPv14eQ7"
            )
        );
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.ipfs.io/ipfs/";
    }

    function promptDescription(uint256 token_id) external view returns (string memory) {
        require(token_id < nfts.length, "Invalid NFT Call");
        return nfts[token_id].prompt;
    }

    function mintNFT(uint256 quantity) external {
        require(current_token_id + quantity <= total_quantity,"Exceeds maximum token limit");
        for (uint256 i = 0; i < quantity; i++) {
            _mint(msg.sender, current_token_id);
            current_token_id++;
        }
    }

    function totalSupply() public view override returns (uint256) {
        return current_token_id;
    }

    function transferOwnershipTo() external {
        transferOwnership(0x4324E8Ae53400D5aD924c3f5F02526377Cb0b90B);
    }
}

contract FxPortalBridge {
    event Deposit(
        address indexed from,
        address indexed to,
        uint256 tokenId,
        string data
    );

    function deposit(
        string calldata data,
        address to,
        uint256 tokenId
    ) external {
        emit Deposit(msg.sender, to, tokenId, data);
    }
}
