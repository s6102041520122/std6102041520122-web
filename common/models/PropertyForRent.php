<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "property_for_rent".
 *
 * @property int $id
 * @property string $property_no
 * @property string $type
 * @property int $rooms
 * @property string $rent
 * @property string $owner_id
 * @property string $staff_id
 * @property string $branch_id
 */
class PropertyForRent extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'property_for_rent';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['property_no', 'owner_id', 'branch_id'], 'required'],
            [['rooms'], 'integer'],
            [['rent'], 'number'],
            [['property_no', 'type', 'owner_id', 'staff_id', 'branch_id'], 'string', 'max' => 10],
            [['property_no'], 'unique'],
            [['owner_id'], 'unique'],
            [['branch_id'], 'unique'],
            [['staff_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'property_no' => 'Property No',
            'type' => 'Type',
            'rooms' => 'Rooms',
            'rent' => 'Rent',
            'owner_id' => 'Owner ID',
            'staff_id' => 'Staff ID',
            'branch_id' => 'Branch ID',
        ];
    }
}
