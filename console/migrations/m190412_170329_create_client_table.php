<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%client}}`.
 */
class m190412_170329_create_client_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%client}}', [
            'id' => $this->primaryKey(),
            'client_no' => $this->string(10)->notNull()->unique(),
            'first_name' => $this->string(300),
            'last_name' => $this->string(300),
            'telephone' => $this->integer(11),
            'pref_type' => $this->string(50), 
            'max_rent' => $this->decimal(7,2)
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%client}}');
    }
}
