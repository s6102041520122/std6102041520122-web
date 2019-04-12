<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "registration".
 *
 * @property int $id
 * @property string $client_id
 * @property string $property_id
 * @property string $date_joined
 */
class Registration extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'registration';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['client_id', 'property_id'], 'required'],
            [['date_joined'], 'safe'],
            [['client_id', 'property_id'], 'string', 'max' => 10],
            [['client_id'], 'unique'],
            [['property_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'client_id' => 'Client ID',
            'property_id' => 'Property ID',
            'date_joined' => 'Date Joined',
        ];
    }
}
