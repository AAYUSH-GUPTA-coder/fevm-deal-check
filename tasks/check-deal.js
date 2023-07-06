task("check-deal", "check deal activation from deal ID")
    .addParam("contract", "The address of the check contract solidity")
    .addParam("dealId", "The deal ID of the deal you want the status of")
    .setAction(async (taskArgs) => {
        const contractAddr = taskArgs.contract
        const dealId = taskArgs.dealId
        const networkId = network.name
        console.log("Getting deal status on network", networkId)

        //create a new wallet instance
        const wallet = new ethers.Wallet(network.config.accounts[0], ethers.provider)

        //create a Check contract factory
        const Check = await ethers.getContractFactory("Check", wallet)
        //create a Check contract instance
        //this is what you will call to interact with the deployed contract
        const check = await Check.attach(contractAddr)

       // send a transaction to call checkDealStatus() method
        // --- Calling checkDealStatus function ---
        let result = await check.checkDealStatus(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The status of deal is:", result)

        // --- Calling checkDealStatusData function  ----
        let fileDataResult = await check.checkDealStatusData(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The status of deal is:", fileDataResult)

        // --- Calling checkDealStatusData1 function ---
        let fileDataResult1 = await check.checkDealStatusData1(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The status of deal is:", fileDataResult1)

        // --- Calling getTerminationTime function -------
        let terminationTime = await check.getTerminationTime(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The Termination Time is:", terminationTime)
        
        // --- Calling getTerminationTimeEpoch function -------
        let TerminationTimeEpoch = await check.getTerminationTimeEpoch(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The Termination Time Epoch is:", TerminationTimeEpoch)

        // --- Termination time ----
        let getTermination =  await check.getTermination(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The Termination Time 1 Epoch is:", getTermination)

        // --- check All function  ----
        let checkAllFunctions =  await check.checkAllFunctions(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The Termination Time 1 Epoch is:", checkAllFunctions)

        let client3 = await check.checkAllFunctions("290")
        console.log(client3)

        // --- getDealTime ---
         let getDealTime =  await check.getDealTime(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The Startibg and Termination Time of Epoch is:", getDealTime)

        // --- getDealEndEpoch ---
         let getDealEndEpoch =  await check.getDealEndEpoch(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The Termination Epoch Time of deal is:", getDealEndEpoch)

        // --- getDealEndTime ---
         let getDealEndTime =  await check.getDealEndEpoch(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The Termination Epoch Time of deal is:", getDealEndTime)

        // --- getDealEndTime ---
         let getDealStartEpoch =  await check.getDealStartEpoch(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The starting Epoch Time is:", getDealStartEpoch)

        // --- getDealEndTime ---
         let getDealStartTime =  await check.getDealStartTime(dealId, {
            gasLimit: 1000000, //797263
        })
        console.log("The starting Epoch Time is:", getDealStartTime)
    })
