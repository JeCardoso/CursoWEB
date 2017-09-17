<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teste de PHP</title>

    <?php 
        $dados = array(
            "titulo"=> "School of NET",
            "link" => "www.schoolofnet.com",
            "conteudo" => array(
                array(
                    "titulo" => "News 1",
                    "resumo" => "Resumo da noticia 1",
                    "texto" => "Esta é a primeira noticia"
                ),
                array(
                    "titulo" => "News 2",
                    "resumo" => "Resumo da noticia 2",
                    "texto" => "Esta é a segunda noticia"
                ),
                array(
                    "titulo" => "News 3",
                    "resumo" => "Resumo da noticia 3",
                    "texto" => "Esta é a terceira noticia"
                )
            )
        );
    ?>

</head>
<body>
    <h1><a href="<?= $dados['link'] ?>"> <?= $dados['titulo'] ?> </a> </h1>
    <hr>
<?php foreach ( $dados['conteudo'] as $key => $value): ?>
    <h3> <?= $value['titulo']; ?> </h3>
    <strong> <?php echo $value['resumo']; ?> </strong>
    <p><?= $value['texto']; ?></p>
    <hr>
<?php endforeach; ?>

</body>
</html>