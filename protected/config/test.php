<?php

return CMap::mergeArray(
	require(dirname(__FILE__).'/main.php'),
	array(
		'components'=>array(
			'fixture'=>array(
				'class'=>'system.test.CDbFixtureManager',
			),
			// uncomment the following to provide test database connection
			'db'=>array(
            'connectionString' => 'mysql:host=localhost;port=3306;dbname=blogdb_test',
            'emulatePrepare' => true,
            'username' => 'blogUser',
            'password' => 'blogPass',
            'charset' => 'utf8',
                
			),
			
		),
	)
);
