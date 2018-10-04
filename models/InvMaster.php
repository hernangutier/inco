<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "inv_master".
 *
 * @property int $id
 * @property string $fecha_ini
 * @property string $ncontrol
 * @property string $descripcion
 * @property int $status
 *
 * @property InvDetail[] $invDetails
 */
class InvMaster extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'inv_master';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['descripcion'], 'required'],
            [['status'], 'integer'],
            [['fecha_ini', 'ncontrol', 'descripcion'], 'string', 'max' => 45],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'fecha_ini' => 'Fecha Ini',
            'ncontrol' => 'Ncontrol',
            'descripcion' => 'Descripcion',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInvDetails()
    {
        return $this->hasMany(InvDetail::className(), ['id_master' => 'id']);
    }
}
