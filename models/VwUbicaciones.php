<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vw_ubicaciones".
 *
 * @property int $id
 * @property string $ubicacion
 */
class VwUbicaciones extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'vw_ubicaciones';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['ubicacion'], 'string', 'max' => 211],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ubicacion' => 'Ubicacion',
        ];
    }
}
