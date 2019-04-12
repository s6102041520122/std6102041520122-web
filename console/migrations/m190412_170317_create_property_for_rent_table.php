<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%property_for_rent}}`.
 */
class m190412_170317_create_property_for_rent_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%property_for_rent}}', [
            'id' => $this->primaryKey(),
            'property_no' => $this->string(10)->notNull()->unique(),
            'type' => $this->string(10),
            'rooms' => $this->integer(5),
            'rent' => $this->decimal(7,2),
            'owner_id' => $this->string(10)->notNull()->unique(),
            'staff_id' => $this->string(10)->unique(),
            'branch_id' => $this->string(10)->notNull()->unique(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%property_for_rent}}');
    }
}
