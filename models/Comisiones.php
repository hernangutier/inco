<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "comisiones".
 *
 * @property int $id
 * @property string $ref
 * @property string $descripcion
 * @property string $date_ini
 * @property string $date_fin
 * @property int $id_chof
 *
 * @property Choferes $chof
 * @property ComisionesDt[] $comisionesDts
 */
class Comisiones extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'comisiones';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['date_ini', 'date_fin'], 'safe'],
            [['id_chof'], 'integer'],
            [['ref', 'descripcion'], 'string', 'max' => 45],
            [['id_chof'], 'exist', 'skipOnError' => true, 'targetClass' => Choferes::className(), 'targetAttribute' => ['id_chof' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ref' => 'Ref',
            'descripcion' => 'Descripcion',
            'date_ini' => 'Desde',
            'date_fin' => 'Hasta',
            'id_chof' => 'Chofer',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getChof()
    {
        return $this->hasOne(Choferes::className(), ['id' => 'id_chof']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComisionesDts()
    {
        return $this->hasMany(ComisionesDt::className(), ['id_com' => 'id']);
    }
}
