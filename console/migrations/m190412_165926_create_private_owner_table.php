<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%private_owner}}`.
 */
class m190412_165926_create_private_owner_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%private_owner}}', [
            'id' => $this->primaryKey(),
            'owner_no' => $this->string(10)->notNull()->unique(),
            'first_name' => $this->string(300),
            'last_name'  => $this->string(300),
            'address'  => $this->string(),
            'telephone'  => $this->integer(11),
            'user_id'=> $this->string(10)->notNull()->unique(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%private_owner}}');
    }
}
