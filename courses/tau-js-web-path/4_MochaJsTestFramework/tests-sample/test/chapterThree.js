describe('Mocha Hooks', function(){

    before('Execute Before All Tests', function(){
        console.log('Execute Before All Tests');
    });

    beforeEach('Execute Before Each Test', function(){
        console.log('Execute Before Each Test');
    });

    after('Execute After All Tests', function(){
        console.log('Execute After All Tests');

    });

    afterEach('Execute After Each Test', function(){
        console.log('Execute After Each Test');
    });

    it('Mocha Hooks Test 1', function(){

        console.log('Mocha - This is Test 1 for Mocha Hooks');
    })

    it('Mocha Hooks Test 2', function(){

        console.log('Mocha - This is Test 2 for Mocha Hooks');
    })

    it('Mocha Hooks Test 3', function(){

        console.log('Mocha - This is Test 3 for Mocha Hooks');
    })
})