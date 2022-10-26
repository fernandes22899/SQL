<!DOCTYPE html>
<html>
        <head>
            <title>CSC 775/875 - Form Input</title>
                <style type="text/css">
                        body    {font-family:"Arial";}
                        pre             {font-size:14pt;}
                </style>
        </head>
        <body>
                <h3> The following items were sent from the form to this PHP script. </h3>
                <?php
                                echo '<pre>GET ';
                                print_r($_GET);
                                echo 'POST ';
                                print_r($_POST);
                                echo '</pre>';
                ?>
                </pre>
        </body>
</html>
