pragma circom 2.0.1;



template Game () {
    signal input direction;
    signal input gameboard[4][4];
    signal output ouputboard[4][4];
    
   log("copyright by www.zkgamestop.com");
   log("author lance deng");



    var gamedata[4][4];
  
    //input 
    for (var i = 0;i<4;i++){
        for (var j=0;j<4;j++){
            gamedata[i][j] = gameboard[i][j];
        }
    }

    signal output s <== gamedata[0][0] * gamedata[0][0];

    

   //left
    if (direction == 37){
            for( var row = 0;row < 4 ;row++){

            for(var i =0; i < 4;i++){
                var k=0;
                for(var j = i+1 ;j< 4;j++){
               
                    if (gamedata[row][i] == 0 && gamedata[row][j] > 0 && k ==0){
                        
                        // log("row",row, i,j);
                        gamedata[row][i]= gamedata[row][j];
                        gamedata[row][j] = 0;
                        k=1;
                    //    log("row",row,gamedata[0][0],gamedata[0][1],gamedata[0][2],gamedata[0][3]);
                        
                    }
                }
            }


            //add 
            if(gamedata[row][0] == gamedata[row][1] && gamedata[row][2] == gamedata[row][3] ){
                gamedata[row][0]= gamedata[row][0] +  gamedata[row][1] ;
                gamedata[row][1] = gamedata[row][2] + gamedata[row][3];
                gamedata[row][2]=0;
                gamedata[row][3]=0;

            }

            if(gamedata[row][0] == gamedata[row][1] && gamedata[row][2] != gamedata[row][3] ){
                gamedata[row][0]= gamedata[row][0] +  gamedata[row][1] ;
                gamedata[row][1] = gamedata[row][2];
                gamedata[row][2]=  gamedata[row][3];
                gamedata[row][3]=0;
            }

            if(gamedata[row][0] != gamedata[row][1] && gamedata[row][2] == gamedata[row][3] && gamedata[row][1] != gamedata[row][2]  ){
                gamedata[row][2]=  gamedata[row][3] + gamedata[row][2];
                gamedata[row][3]=0;
            }

            if(gamedata[row][0] != gamedata[row][1] && gamedata[row][1] == gamedata[row][2]  ){
                gamedata[row][1] = gamedata[row][1] + gamedata[row][2];
                gamedata[row][2]=  gamedata[row][3];
                gamedata[row][3]=0;
            }
            

         }

     



    }
    

    //right
    if (direction == 39){
            for( var row = 0;row < 4 ;row++){
        // log("row",row);
            for(var i =3; i >= 0;i--){
                var k=0;
                for(var j = i-1 ;j>= 0;j--){
                    // log("row",row, i,j,gamedata[row][i] ,gamedata[row][j] );
                    if (gamedata[row][i] == 0 && gamedata[row][j] > 0 && k ==0){
                        
                        // log("row",row, i,j);
                        gamedata[row][i]= gamedata[row][j];
                        gamedata[row][j] = 0;
                        k=1;
                    //    log("row",row,gamedata[0][0],gamedata[0][1],gamedata[0][2],gamedata[0][3]);
                        
                    }
                }
            }

            if(gamedata[row][0] == gamedata[row][1] && gamedata[row][2] == gamedata[row][3] ){
             
                gamedata[row][3]=gamedata[row][3] +  gamedata[row][2] ;
                gamedata[row][2]=gamedata[row][1] + gamedata[row][0];
                gamedata[row][0]= 0;
                gamedata[row][1] = 0;

            }

            if(gamedata[row][0] == gamedata[row][1] && gamedata[row][2] != gamedata[row][3] &&  gamedata[row][2] != gamedata[row][1]){
                
                gamedata[row][1] =  gamedata[row][0] +  gamedata[row][1] ;
                gamedata[row][0]= 0;
              
            }

            if(gamedata[row][0] != gamedata[row][1] && gamedata[row][2] == gamedata[row][3] ){
                gamedata[row][3]=  gamedata[row][3] + gamedata[row][2];
                gamedata[row][2]= gamedata[row][1] ;
                 gamedata[row][1]= gamedata[row][0] ;
                  gamedata[row][0]= 0 ;

            }

            if( gamedata[row][1] == gamedata[row][2] && gamedata[row][2] != gamedata[row][3]  ){
                gamedata[row][2] = gamedata[row][1] + gamedata[row][2];
                gamedata[row][1]=  gamedata[row][0];
                gamedata[row][0]=0;
            }

         }
    }

    //down
    if (direction == 40){
            for( var col = 0;col < 4 ;col++){
        // log("row",row);
            for(var i =3; i >= 0;i--){
                var k=0;
                for(var j = i-1 ;j>= 0;j--){
                    // log("row",row, i,j,gamedata[row][i] ,gamedata[row][j] );
                    if (gamedata[i][col] == 0 && gamedata[j][col] > 0 && k ==0){
                        
                        // log("row",row, i,j);
                        gamedata[i][col]= gamedata[j][col];
                        gamedata[j][col] = 0;
                        k=1;
                    //    log("row",row,gamedata[0][0],gamedata[0][1],gamedata[0][2],gamedata[0][3]);
                        
                    }
                }
            }

            //add

           if(gamedata[3][col] == gamedata[2][col] && gamedata[1][col] == gamedata[0][col] ){
                gamedata[3][col] = gamedata[2][col] + gamedata[3][col];
                gamedata[2][col] = gamedata[0][col] + gamedata[1][col];
                
                gamedata[0][col] = 0;
                gamedata[1][col] = 0;
            }

            if(gamedata[3][col] == gamedata[2][col] && gamedata[1][col] != gamedata[0][col] ){
                gamedata[3][col] = gamedata[2][col] + gamedata[3][col];
                gamedata[2][col] = gamedata[1][col];
                gamedata[1][col] = gamedata[0][col];
                gamedata[0][col] = 0;
            }

            if(gamedata[3][col] != gamedata[2][col] && gamedata[1][col] == gamedata[0][col] && gamedata[2][col] != gamedata[1][col] ){
                gamedata[1][col] = gamedata[1][col] + gamedata[0][col];
                gamedata[0][col] = 0;
            }

            if(gamedata[3][col] != gamedata[2][col] && gamedata[2][col] == gamedata[1][col]  ){
                gamedata[2][col] = gamedata[2][col] + gamedata[1][col];
                gamedata[1][col] = gamedata[0][col];
                gamedata[0][col] = 0;
            }

         }
    }

    //up
    //left
    if (direction == 38){
            for( var col = 0;col < 4 ;col++){
        // log("row",row);
            for(var i =0; i < 4;i++){
                var k=0;
                for(var j = i+1 ;j< 4;j++){
                    // log("row",row, i,j,gamedata[row][i] ,gamedata[row][j] );
                    if (gamedata[i][col] == 0 && gamedata[j][col] > 0 && k ==0){
                        
                        // log("row",row, i,j);
                        gamedata[i][col]= gamedata[j][col];
                        gamedata[j][col] = 0;
                        k=1;
                    //    log("row",row,gamedata[0][0],gamedata[0][1],gamedata[0][2],gamedata[0][3]);
                        
                    }
                }
            }
            
            if(gamedata[3][col] == gamedata[2][col] && gamedata[1][col] == gamedata[0][col] ){
                gamedata[0][col] = gamedata[0][col] + gamedata[1][col];
                gamedata[1][col] = gamedata[2][col] + gamedata[3][col];
                gamedata[2][col] = 0;
                gamedata[3][col] = 0;
            }

             if(gamedata[3][col] != gamedata[2][col] && gamedata[1][col] == gamedata[0][col] ){
                gamedata[0][col] = gamedata[1][col] + gamedata[0][col];
                gamedata[1][col] = gamedata[2][col];
                gamedata[2][col] = gamedata[3][col];
                gamedata[3][col] = 0;
            }

             if(gamedata[2][col] == gamedata[1][col] && gamedata[1][col] != gamedata[0][col]  ){
                gamedata[1][col] = gamedata[2][col] + gamedata[1][col];
                gamedata[2][col] = gamedata[3][col];
                gamedata[3][col] = 0;
            }

            if(gamedata[3][col] == gamedata[2][col] && gamedata[1][col] != gamedata[0][col]  ){
                gamedata[2][col] = gamedata[2][col] + gamedata[3][col];
                gamedata[3][col] = 0;
            }

           

           

         }
    }



   log(" --input-- ");
   log(gameboard[0][0],gameboard[0][1],gameboard[0][2],gameboard[0][3]);
   log(gameboard[1][0],gameboard[1][1],gameboard[1][2],gameboard[1][3]);
   log(gameboard[2][0],gameboard[2][1],gameboard[2][2],gameboard[2][3]);
   log(gameboard[3][0],gameboard[3][1],gameboard[3][2],gameboard[3][3]);
   log(" --output-- ");
   log(gamedata[0][0],gamedata[0][1],gamedata[0][2],gamedata[0][3]);
   log(gamedata[1][0],gamedata[1][1],gamedata[1][2],gamedata[1][3]);
   log(gamedata[2][0],gamedata[2][1],gamedata[2][2],gamedata[2][3]);
   log(gamedata[3][0],gamedata[3][1],gamedata[3][2],gamedata[3][3]);



    for(var  i =0;i<4;i++){
        for(var j=0;j<4;j++ ){
            ouputboard[i][j] <-- gamedata[i][j];
        }
    }

}

component main = Game();
/*

INPUT = {
    "direction":"37",
    "gameboard":[[4,2,2,2],[2,2,4,0],[2,2,0,2],[2,4,2,4]]
}

 */
