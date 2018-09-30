pragma solidity ^0.4.24; // Set compiler version

// Token contract
contract Facito {
    string public name = "Facito"; // Name
    string public symbol = "FAC"; // Symbol
    uint256 public totalSupply; // Store total supply

    mapping(bytes32 => Article) public articles; // Store articles

    event Transfer (
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approve (
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    struct Article {
        string Title;
        bytes32 ID;
        string Content;
        string HeaderSource;
        address Author;
        mapping(address => uint) UnspentOutputs;
    }

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(uint256 _initialSupply) public {
        balanceOf[this] = _initialSupply; // Set contract balance
        totalSupply = _initialSupply; // Set total supply
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value); // Check for invalid balance

        balanceOf[msg.sender] -= _value; // Set sender balance
        balanceOf[_to] += _value; // Set recipient balance

        emit Transfer(msg.sender, _to, _value); // Emit transfer event

        return true; // Return success
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value; // Set allowance

        emit Approve(msg.sender, _spender, _value); // Emit approve event

        return true; // Return success
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]); // Check allowance is valid
        require(_value <= allowance[_from][msg.sender]); // Check allowance is valid

        balanceOf[_from] -= _value; // Remove from sender
        balanceOf[_to] += _value; // Add to destination

        allowance[_from][msg.sender] -= _value; // Remove allowance

        emit Transfer(_from, _to, _value); // Emit transfer event

        return true; // Return success
    }

    function newArticle(string _title, string _content, string _headerSource, address _author) public returns (bool success) {
        Article memory article = Article(_title, keccak256(abi.encodePacked(_title, _content, _headerSource, _author)), _content, _headerSource, _author); // Initialize article

        articles[keccak256(abi.encodePacked(_title, _content, _headerSource, _author))] = article; // Push new article

        return true; // Return success
    }

    function readArticle(bytes32 _id) public returns (bool success) {
        require(articles[_id].UnspentOutputs[msg.sender] == 0, "Article already read"); // Check article hasn't already been read

        articles[_id].UnspentOutputs[msg.sender] = 1; // Set spent

        transfer(msg.sender, (balanceOf[this]/totalSupply)*10); // Transfer coins

        return true; // Return success
    }
}