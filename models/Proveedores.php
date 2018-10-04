<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "proveedores".
 *
 * @property int $id
 * @property string $rif
 * @property string $razon
 *
 * @property Recepcion[] $recepcions
 */
class Proveedores extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'proveedores';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['rif'], 'string', 'max' => 20],
            [['razon'], 'string', 'max' => 200],
            [['rif'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'rif' => 'Rif',
            'razon' => 'Razon',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRecepcions()
    {
        return $this->hasMany(Recepcion::className(), ['id_prov' => 'id']);
    }
}
