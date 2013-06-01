// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  

  if( $(".player-turn-marker").text() == "Player 1" )
  {
    $(".player-2-turn").hide();

    $(".square0").click(function(){         
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_0_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }
    });     

    $(".square1").click(function(){    
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_1_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }
    });  

    $(".square2").click(function(){   
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_2_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }       
    });  

    $(".square3").click(function(){  
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_3_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }          
    });  

    $(".square4").click(function(){  
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_4_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }  
    });  

    $(".square5").click(function(){   
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_5_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }        
    });  

    $(".square6").click(function(){   
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_6_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }          
    });  

    $(".square7").click(function(){     
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_7_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }        
    });                              

    $(".square8").click(function(){   
      if ( $(this).find('img').attr('alt') == "Blank")
      {
        $("#tictactoe_squares_attributes_8_value").attr("value","X");
        $("form").submit();
      }
      else
      {
        alert("Please select a valid square.")
      }      
    });  
  }



  if( $(".player-turn-marker").text() == "Player 2" )
  {
    $(".player-1-turn").hide();  

    setTimeout(function() {
      switch ($(".cpu-move-marker").text())
      {
      case "0":
        $("#tictactoe_squares_attributes_0_value").attr("value","O");
        $("form").submit();
        break;
      case "1":
        $("#tictactoe_squares_attributes_1_value").attr("value","O");
        $("form").submit();
        break;
      case "2":
        $("#tictactoe_squares_attributes_2_value").attr("value","O");
        $("form").submit();
        break;
      case "3":
        $("#tictactoe_squares_attributes_3_value").attr("value","O");
        $("form").submit();
        break;
      case "4":
        $("#tictactoe_squares_attributes_4_value").attr("value","O");
        $("form").submit();
        break;
      case "5":
        $("#tictactoe_squares_attributes_5_value").attr("value","O");
        $("form").submit();
        break;
      case "6":
        $("#tictactoe_squares_attributes_6_value").attr("value","O");
        $("form").submit();
        break;
      case "7":
        $("#tictactoe_squares_attributes_7_value").attr("value","O");
        $("form").submit();
        break;
      case "8":
        $("#tictactoe_squares_attributes_8_value").attr("value","O");
        $("form").submit();
        break;                                    
      }
    }, 2000);
  }  



  if( $(".player-winner-marker").text() == "Player 1" )
  {
    $(".player-2-winner").hide();
    $(".player-no-winner").hide();
  }
  if( $(".player-winner-marker").text() == "Player 2" )
  {
    $(".player-1-winner").hide();
    $(".player-no-winner").hide();    
  }  
  if( $(".player-winner-marker").text() == "Draw" )
  {
    $(".player-1-winner").hide();
    $(".player-2-winner").hide();
  }  


  

  $(".reset").click(function(){          
    $("#tictactoe_squares_attributes_0_value").attr("value","");
    $("#tictactoe_squares_attributes_1_value").attr("value","");
    $("#tictactoe_squares_attributes_2_value").attr("value","");
    $("#tictactoe_squares_attributes_3_value").attr("value","");
    $("#tictactoe_squares_attributes_4_value").attr("value","");
    $("#tictactoe_squares_attributes_5_value").attr("value","");
    $("#tictactoe_squares_attributes_6_value").attr("value","");
    $("#tictactoe_squares_attributes_7_value").attr("value","");
    $("#tictactoe_squares_attributes_8_value").attr("value","");
    $("form").submit();  
  });

});
