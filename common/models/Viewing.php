<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "viewing".
 *
 * @property int $id
 * @property string $client_id
 * @property string $property_id
 * @property string $view_date
 * @property string $comment
 */
class Viewing extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'viewing';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['client_id', 'property_id'], 'required'],
            [['view_date'], 'safe'],
            [['client_id', 'property_id'], 'string', 'max' => 10],
            [['comment'], 'string', 'max' => 255],
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
            'view_date' => 'View Date',
            'comment' => 'Comment',
        ];
    }
}
