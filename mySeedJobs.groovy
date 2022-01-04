folder('AmitabhBachan')
folder('Dharmendra')
folder('Rajkappor')
folder('AmitabhBachan/Abhishek')
folder('AmitabhBachan/Shweta')
folder('Dharmnedra/SunyDelo')
folder('Dharmendra/Bobydelo')
job('AbmitabhBachan/Abhishek/Aradhya'){
    stages{
        steps{
            sh 'echo Hello Aradhya'
        }
    }
}